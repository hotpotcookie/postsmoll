# postsmoll // (n). Postman, but rly smoll
**postsmoll** docs is coming up
## Basic Demos
``` bash
## creating workspace & request collection
[psmoll]~ ws create laas
[psmoll]~ ws use laas
[psmoll/laas]~ req add AddGuest
[psmoll/laas]~ req show
AddGuest  GetGuest  GetGuestByUsername	UpdateGuestPhone

## configure a request (using nano)
[psmoll/laas]~ req config AddGuest
[psmoll/laas]~ req info AddGuest
URL    : http://localhost:3000/api/user/guest/add
method : POST
body   : {"username":"aster-max","fullname":"Snowy Oreo M.","phone":"08132123345","address":"Jl. Permata III B25, Mampang Prapatan, Pejaten Barat","postal_code":"12520","activation":1,"password":"kucheng"}

## running a request
[psmoll/laas]~ req run AddGuest
{
  "data": {
    "username": "aster-max",
    "fullname": "Snowy Oreo M.",
    "phone": "08132123345",
    "address": "Jl. Permata III B25, Mampang Prapatan, Pejaten Barat",
    "postal_code": "12520",
    "activation": 1,
    "salt": "OEpl0WBpbVYa39wJ",
    "hash": "c56b58edddf91f54e64707fe7dee8eecac48fbfc2c362148078ef8eae7a05993",
    "created_at": "2021-12-23T21:44:48.782326667+07:00",
    "updated_at": "2021-12-23T21:44:48.782326667+07:00"
  }
}
```
## Dependencies
```bash
curl (7.68.0)
jq (1.6)
nano (4.8)
```
## Tree Structure
``` bash
.
├── LICENSE
├── postsmoll.sh
├── README.md
├── source
│	├── run-init.sh
│	└── run-menu.sh
└── workspace
    └── laas
        ├── GetGuest
        ├── GetGuestByUsername
        └── UpdateGuestPhone

```
## Contributions
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please make sure to update tests as appropriate. 👏
