# CETA-Token-Ethereum-Smart-Contract-and-Exchange-Platform
A platform that enables USD to CETA token onboarding. CETA token is an ethereum token that supports peer to peer transfers.


## Overview 

### Smart Contract

The smart contract is written in solidity programming language using the object oriented programming technique. I have used truffle to create a project on my local mac os machine. Truffle automatically creates the project structure and allows the user to add smart contracts in the contract folder.

### Flask Webapp

The user inputs data into the HTML form. JavaScript is used to connect to the stripe gateway. It also collects the data from the  HTML form and parses it onto the python sessions. Python manages sessions in the webapp and loads html pages and transfers ERC-20 depending on which session is called by the java script code. 

### Stripe Integration

I have chosen the option of transferring the user from my webapp to stripe’s payment gateway. This is the process I have prefered over transferring user credit information through rest API, as stripe’s gateway has better security and collecting personal account information on my webapp might lead to a potential security breach.

### ERC 20 Coin Transfer 

After passing the credit card information on the stripe gateway, stripe either approves or disapproves the transaction. Approval and disapproval are two unique sessions in python. When cancelled session is called, a html page is rendered along with a message to retry. In the case when approve function is called, and html page is rendered that asks the user to check their metamask account and the transfer of erc-20 token takes place.


## Installation 

### Smart Contract Deployment
Step 1:
Download and install NPM using the following link:

https://nodejs.org/en/download/

Step 2:
Download MetaMask plugin in your Chrome or Firefox browser using the following link (you need to have chrome or Firefox web browser installed for this step): 

https://metamask.io/download.html

Step 3:
Install truffle using npm

$ npm install truffle -g

Step 4:
Download and install ganache using the following link:

https://www.trufflesuite.com/ganache

Step 5:
Install npm after downloading the submission file in the following directory: 
singh-assignment -> tutorial-token

$ npm install

Step 6:
Compile contract using truffle

$ truffle compile

Step 7:
Setup Ganache

  i.	Create work-stream


  ii.	Give a Name then click on add project


  iii.	Select file 
  [after clicking on add project navigate to singh-assignment -> tutorial-token directory and select truffle.js]

  iv.	Save workplace 


  v.	Run truffle tests

  $ truffle test

  vi.	Deploy using truffle

  $ truffle deploy

  vii.	Output (Export Path and Private Key)


  viii.	Output (Contract Address)
  [Ganache -> Contracts]
  
Step 8:
Setup MetaMask

i.	Create custom network [click network name to see menu and select custom RPC]
 
ii.	Fill network name, URL (ganache export path) and Chain ID (use 0x5b)

 
iii.	Import account [click on account image to see menu]

 

iv.	Fill private key of ganache account
 

v.	Add Token in new imported account

 

vi.	Chose custom token and input ganache contract address [click on next -> add token]

 

vii.	Output (metamask account address) [CET token visible in metamask]


### Stripe setup

Step 1:
Register for a stripe account using the following link:
https://dashboard.stripe.com/register

Step 2:
Set Account Name

Step 3:
API keys [Navigate to Developers -> API keys]

### Flask webapp installation 

Step 1: 
Create and activate a python virtual environment after downloading the submission file in the following directory: singh-assignment -> flask-stripe-checkout -> env 

$ python3 -m venv venv && source venv/bin/activate

Step 2:
Install requirement.txt

(venv)$ pip3 install -r requirements.txt

Step 3:
Add stripe publishable key and secret key as environment variables 

(env)$ export STRIPE_PUBLISHABLE_KEY=<YOUR_STRIPE_PUBLISHABLE_KEY>
(env)$ export STRIPE_SECRET_KEY=<YOUR_STRIPE_SECRET_KEY>
(env)$ export STRIPE_ENDPOINT_SECRET=<YOUR_STRIPE_SECRET_KEY>

Step 4:
Add ganache export path, ganache contract address and metamask account address 

(env)$ export HTTP=<GANACHE_EXPORT_PATH>
(env)$ export CONTRACT_ADDRESS=<GANACHE_CONTRACT_ADDRESS>
(env)$ export SENDERS_ADDRESS=<METAMASK_ACCOUNT_ADDRESS>

Step 5:
Run the server using the following command:

(env)$ FLASK_ENV=development python app.py

Step 6:
Open http://localhost:5000  in the browser


