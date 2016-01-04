sudo iptables -t nat -D POSTROUTING -s 10.0.7.0/24 -j MASQUERADE
