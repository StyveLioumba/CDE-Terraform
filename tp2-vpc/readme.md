# Etapes

1 VPC ayant pour cidr_block: 10.1.0.0/16.
1 Internet Gateway rattachée au vpc.
1 Subnet dans l'availability_zone_A ayant pour cidr_block: 10.1.0.0/24.
1 Subnet dans l'availability_zone_B ayant pour cidr_block: 10.1.1.0/24.
1 Route Table ayant comme route 0.0.0.0/0 l'internet gateway.
2 Route Table Association pour associer chaque subnet à la route table.