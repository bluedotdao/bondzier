const {
    expect
} = require("chai");

var bezier1155, Bondzier, bondzier, bondzierFactory;
describe("Bondzier", function() {
    it("must succesfully deploy all required contracts", async function() {
        const [deployer] = await ethers.getSigners();
        const Bezier1155 = await ethers.getContractFactory("Bondzier1155");
        bezier1155 = await Bezier1155.deploy("");
        await bezier1155.deployed();
         Bondzier = await ethers.getContractFactory("Bondzier");
        bondzier = await Bondzier.deploy();
        await bondzier.deployed();
      
        const BondzierFactory = await ethers.getContractFactory("BondzierFactory");
        bondzierFactory = await BondzierFactory.deploy(bondzier.address, bezier1155.address);
        await bondzierFactory.deployed();
        let role = await bezier1155.DEFAULT_ADMIN_ROLE()
        await bezier1155.grantRole(role, bondzierFactory.address)
        await bezier1155.renounceRole(role, deployer.address)
    })

    it("must not be able to init Bondzier implementation contract", async function() {

        const [deployer] = await ethers.getSigners();
        let timestamp = Math.round(Date.now() / 1000)
        let text = "Hello World!";
        let bytes = ethers.utils.toUtf8Bytes(text);
        await expect(
            bondzier.init(42, true, 12, 12, [0, 1, 0, 1, 0, 1], deployer.address, timestamp, "", bondzier.address, bytes)
        ).to.be.revertedWith("cannot init.");
    })
    it("must not be able to init new bondzier contract after it is created", async function() {

        const [deployer, acc2] = await ethers.getSigners();
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Hello World!";
        let bytes = ethers.utils.toUtf8Bytes(text);

        let total = ethers.utils.parseUnits('7', 18)
        let new_total = ethers.utils.parseUnits('9', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('Bondzier');


        let bb = await bondzierFactory.createBondzier(true, amnt, total, [0, 1, 0, 1, 0, 1], deployer.address, timestamp, "https://bondzier.io", salt, bytes, {
            gasLimit: 900000
        });
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        await expect(
            _bondzier.init(42, true, amnt, total, [0, 2, 0, 2, 0, 2], deployer.address, timestamp + 9000000, "", bondzier.address, bytes)
        ).to.be.revertedWith("cannot init.");
    })
     it("must not be able to init new bondzier contract with the same seed", async function() {

        const [deployer, acc2] = await ethers.getSigners();
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);

        let total = ethers.utils.parseUnits('5', 18)
        let amnt = 2;
        let salt = ethers.utils.formatBytes32String('Bondzier');

        await expect(
           bondzierFactory.createBondzier(false, amnt, total, [0, 3, 0, 3, 0, 3], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        ).to.be.revertedWith("ERC1167: create2 failed");
    })
    it("must not be able to buy more than available", async function() {

        const [deployer, acc2] = await ethers.getSigners();
       
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);
         let startPrice = 0
         let endPrice = 3
        let total = ethers.utils.parseUnits('3', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('NewBondzier');
        let bb = await bondzierFactory.createBondzier(true, amnt, total, [startPrice, 3, 0, 3, 0, endPrice], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
         let balanceStart = await deployer.getBalance();
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        let nextPrice = await _bondzier.nextPrice()
        expect(nextPrice.toString()).to.equal('0')
        await _bondzier.buy({value : nextPrice})
        nextPrice = await _bondzier.nextPrice()
        expect(nextPrice.toString()).to.equal('0')
        await _bondzier.buy({value : nextPrice})
        nextPrice = await _bondzier.nextPrice()
        expect(nextPrice.toString()).to.equal('3')
        await _bondzier.buy({value : nextPrice})
        let balanceEnd = await deployer.getBalance();
        await expect(balanceEnd.sub(balanceStart).toString()).to.equal('3')
        await expect(
           _bondzier.nextPrice()
        ).to.be.revertedWith("Sold Out.");
        
    
    })
    it("Owner must recieve sell proceeds", async function() {

        const [deployer, acc2] = await ethers.getSigners();
       
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);
         let startPrice = 0
         let endPrice = 3
        let total = ethers.utils.parseUnits('3', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('NewBondzier2');
        let bb = await bondzierFactory.createBondzier(true, amnt, total, [startPrice, 3, 0, 3, 0, endPrice], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
         let balanceStart = await deployer.getBalance();
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        let nextPrice = await _bondzier.nextPrice()
        await _bondzier.buy({value : nextPrice})
        nextPrice = await _bondzier.nextPrice()
        await _bondzier.buy({value : nextPrice})
        nextPrice = await _bondzier.nextPrice()
        await _bondzier.buy({value : nextPrice})
        let balanceEnd = await deployer.getBalance();
        await expect(balanceEnd.sub(balanceStart).toString()).to.equal('3')

        
    
    })
    it("Buyer must recieve the token after buy", async function() {

        let abi = [
    "event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value)"
];

let iface = new ethers.utils.Interface(abi)
        const [deployer, acc2] = await ethers.getSigners();
       
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);
         let startPrice = 0
         let endPrice = 3
        let total = ethers.utils.parseUnits('3', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('NewBondzier3');
        let bb = await bondzierFactory.createBondzier(true, amnt, total, [startPrice, 3, 0, 3, 0, endPrice], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
         let balanceStart = await deployer.getBalance();
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        let nextPrice = await _bondzier.nextPrice()
        let buyTransaction = await _bondzier.buy({value : nextPrice})
        let buyRes = await buyTransaction.wait()

        
        expect(iface.parseLog(buyRes.events[0]).args.to).to.equal(acc2.address)

        expect(iface.parseLog(buyRes.events[0]).args.value.toString()).to.equal('1')        
    
    })


    it("If the token is non-fungible, each buy should generate new token id", async function() {

        let abi = [
    "event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value)"
];

let iface = new ethers.utils.Interface(abi)
        const [deployer, acc2] = await ethers.getSigners();
       
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);
         let startPrice = 0
         let endPrice = 3
        let total = ethers.utils.parseUnits('3', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('NewBondzier4');
        let bb = await bondzierFactory.createBondzier(true, amnt, total, [startPrice, 3, 0, 3, 0, endPrice], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
         let balanceStart = await deployer.getBalance();
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        let nextPrice = await _bondzier.nextPrice()
        let buyTransaction = await _bondzier.buy({value : nextPrice})
        let buyRes = await buyTransaction.wait()

        let nextPrice2 = await _bondzier.nextPrice()
        let buyTransaction2 = await _bondzier.buy({value : nextPrice})
        let buyRes2 = await buyTransaction2.wait()
        //console.log(buyRes.events[0])
        //console.log(acc2.address)

        expect(iface.parseLog(buyRes.events[0]).args.id.toString() !== iface.parseLog(buyRes2.events[0]).args.id.toString())
        
        
    
    })
    it("If the token is fungible, each buy should generate same token id", async function() {

        let abi = [
    "event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value)"
];

let iface = new ethers.utils.Interface(abi)
        const [deployer, acc2] = await ethers.getSigners();
       
        let timestamp = Math.round(Date.now() / 1000) + 900
        let text = "Pozz!";
        let bytes = ethers.utils.toUtf8Bytes(text);
         let startPrice = 0
         let endPrice = 3
        let total = ethers.utils.parseUnits('3', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('NewBondzier5');
        let bb = await bondzierFactory.createBondzier(true, amnt, total, [startPrice, 3, 0, 3, 0, endPrice], deployer.address, timestamp, "https://bondzier2.io", salt, bytes, {
            gasLimit: 900000
        })
        let res = await bb.wait();
        let newBondzierAddress = res.events[0].args.newBondzierAddress;
         let balanceStart = await deployer.getBalance();
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        let nextPrice = await _bondzier.nextPrice()
        let buyTransaction = await _bondzier.buy({value : nextPrice})
        let buyRes = await buyTransaction.wait()

        let nextPrice2 = await _bondzier.nextPrice()
        let buyTransaction2 = await _bondzier.buy({value : nextPrice})
        let buyRes2 = await buyTransaction2.wait()
        //console.log(buyRes.events[0])
        //console.log(acc2.address)

        expect(iface.parseLog(buyRes.events[0]).args.id.toString() === iface.parseLog(buyRes2.events[0]).args.id.toString())
        
        
    
    })
});