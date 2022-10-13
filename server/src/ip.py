import requests

ip = requests.get('http://169.254.169.254/latest/meta-data/public-ipv4')

with open('config.txt', 'r') as file:
    [key, url, _blank] = file.read().split('\n')
    requests.post(url,
                  headers={'Authorization': key}, data={'ip': ip})
