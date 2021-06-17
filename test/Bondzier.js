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

        let total = ethers.utils.parseUnits('4', 18)
        let new_total = ethers.utils.parseUnits('8', 18)
        let r_start = ethers.utils.parseUnits('100', 18)
        let r_end = ethers.utils.parseUnits('150', 18)
        let p1x = ethers.utils.parseUnits('1', 18)
        let p1y = ethers.utils.parseUnits('160.47', 18)
        let p2x = ethers.utils.parseUnits('1', 18)
        let p2y = ethers.utils.parseUnits('177.80', 18)
        let amnt = 1;
        let salt = ethers.utils.formatBytes32String('Bondzier');


        let bb = await bondzierFactory.createBondzier(true, amnt, total, [0, 1, 0, 1, 0, 1], deployer.address, timestamp, "https://bondzier.io", salt, bytes, {
            gasLimit: 900000
        });
        let res = await bb.wait();
        let newBondzierAddress = res.events[2].args.newBondzierAddress;
        const _bondzier = new ethers.Contract(newBondzierAddress, Bondzier.interface, acc2);
        await expect(
            _bondzier.init(42, true, amnt, total, [0, 1, 0, 1, 0, 1], deployer.address, timestamp + 9000000, "", bondzier.address, bytes)
        ).to.be.revertedWith("cannot init.");
    })
});