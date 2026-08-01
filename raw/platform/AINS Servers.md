
# Servers

호서대 제2공대 4F 서버실 구축한 서버 정보.

Hoseo Network
- public ip: 210.119.108.241 ~ 244
- gw: 210.119.108.254
- subnet: 255.255.255.0
- dns: 134.75.122.2, 168.126.63.1


## Domain

- ains-lab.duckdns.org

## Server Lists

| category | hostname | private ip   | public ip       | desc     | dns                               |
| :------- | -------- | ------------ | --------------- | -------- | --------------------------------- |
| ap       | tplink   | 10.10.1.0/24 | 210.119.108.241 | 공유기      |                                   |
| k8s      | master01 | 10.10.1.10   | N/A             | rtx-4070 |                                   |
|          | worker01 | 10.10.1.11   | N/A             |          |                                   |
|          | worker02 | 10.10.1.12   | N/A             |          |                                   |
|          | worker03 | 10.10.1.13   | 210.119.108.243 |          |                                   |
| synology |          | 10.10.1.242  | 210.119.108.242 |          | https://ains-lab.duckdns.org:5001 |
| harness  | harenss  | 10.10.1.244  | 210.119.108.244 | mini-pc  |                                   |
|          |          |              |                 |          |                                   |
|          |          |              |                 |          |                                   |

## Services


