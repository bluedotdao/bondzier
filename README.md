# 🥸 Bondzier 
#####   /BOND-zee-ay/

Customizable bezier bonding curves. Create, mint and sell erc1155 fungible or non-fungible tokens.

![Example Bondzier Curves](bondzier.jpg?raw=true "Example Bondzier Curves")

## Bondzier

This software is experimentation with a token model better suited to business that have already produced a physical item, and they wish to sell it as a tokenized good on-chain, allowing you to claim the physical item later. The claim process is outside of the scope of this experiment.


[Check generated docs here](/docs)

[Read mythx report here](/reports/mythx.md)

[Read slither report here](/reports/slither/)

## Motivation


### Case study 1

Imagine for a moment that you are small, local meat deli shop owner specialized in Black Slavonian Pig products, wishing to sell 500 premium pieces of Kulen (a type of cured sausage made of minced pork). Each Kulen is unique in weight and is marked with a unique serial number.

You wish to issue an NFT for each kulen you produced and sell your Kulen on-chain. After a bit of research and talks with your local Ethereum community and finding out about Unisocks, you seem to find an applicable model (although you find the current $90 price tag for a pair of socks ridiculous). But after few days of exploring the unisocks model, you encounter some obstacles:

- Most of your money was spent on producing Kulens, and your available assets are limited -> providing initial uniswap liquidity is a challenge.

- You need to find a solidity developer to write and deploy smart contracts, create uniswap market -> is expensive and complicated process for you.

- You like the dynamic aspect of unisocks pricing, but find the `k = x * y` bonding curve unsuitable for your model, as you are aware that selling the 500-th Kulen for millions of dollars is unrealistic -> you will not sell all your token issuance.

- the Kulens have expiry date -> you must sell them all before a specific date.

You wish for a better, easier model.

### Case study 2

Imagine you are a part of organisation of a music festival operating for the last decade, visited by thousands of people each year. After following the advancements in smart contracts, you see value in reimaging your festival as a community-owned, DAO Music Festival where the members of the community decide on the festival parameters (eg which performers will be picked for the next year lineup).

After discussion with your team, a smart contract system is imagined allowing you to issue 5000 dynamically priced festival nft tickets, but you are aware the ticket pricing mechanism must follow certain rules. (eg. early bird tickets are cheaper than the last-minute tickets) and that the realistic price community is prepared to pay for the tickets is ranging $100 in the early bird phase, and around $300 for the last-minute tickets. Also, the ticket sales must be halted 24 hours before the festival starts.

After looking for a suitable technical solution, you find most require you to invest time and money in developing a custom solution, but also to lock some funds as a liquidity. Since most of your budget is already reserved for the performers, venue decoration and other festival expenses so your guests can have a time of their life, you find this process inefficient.



### Bezier Curves library

"Bézier curve (/ˈbɛz.i.eɪ/ BEH-zee-ay) is a parametric curve used in computer graphics and related fields. The curves, which are related to Bernstein polynomials, are named after Pierre Bézier, who used it in the 1960s for designing curves for the bodywork of Renault cars. Other uses include the design of computer fonts and animation." - from wikipedia [article on bezier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve)



For this experiment, we have envisioned a new application for the bezier curve - as a bonding curve to describe the relationship between the price and available supply when selling digital goods.

This repo contains bezier.sol, a Solidity library implementing bezier curves, enabling you to work with them in your solidity projects. The library is dependent on a [fixed-point math solidity library](https://github.com/hifi-finance/prb-math) 

`check out bezier.sol for more details`

### Bondzier Factory contract

A smart contract allowing you to create a new erc1155 token suited for your business requirements. This token is then offered for sale where the price is defined per your custom bezier curve (you define total issuance, price range, fungibility of the token, owner address where the funds from sales will be sent, market end time... )

Bondzier factory uses create2 to create new bondzier markets and tokens.

`check out BondzierFactory.sol and Bondzier.sol for more details`

### Bondzier1155 token contract

Based on OpenZeppelin's erc1155 implementation, Bondzier1155 token allows for mixed fungible/nonfungible tokens, and a unique url per new token id.

`see Bondzier1155.sol for more details`


### Frontend

Frontend is a bootstraped, basic interface allowing you to create, explore new bondzier markets and buy newly created tokens. The bezier curve canvas where your curves are displayed is developed on top of p5.js.

`see index.html and explore.html for more details`

There are two basic types of user envisioned for this system:

1) Business/individuals aiming to sell items on chain create a new bondzier market with best suited parameters.
2) Interested buyers will buy items per price as defined by the bezier curve. The newly bought token will be minted, and the received funds will be sent to the owner address. Any remaining change will be returned to the buyer.

## Quick start:

```
npm install
npm test
```

#### first terminal instance:

```
nvm use 12
npm run start:node
```
This will start local hardhat node

---

#### second terminal instance:

```
nvm use 12
npm run deploy:local
```
This will deploy contracts, create a bondzier market and do some buys.

---

#### third terminal instance:

```
nvm use 12
npm run start:server
```

This will start http server and serve index.html file on localhost

## Warning // Caveat Emptor

- This is untested, experimental software written in a short period of time.
- Unlicensed (aiming for MIT release when atleast basic tests are written)
- Written with xDai network in mind.
- Expect the unexpected changes.


Hit me up here with any questions/ideas (raise an issue) or contact me on twitter (@njokic).

Cheers!
