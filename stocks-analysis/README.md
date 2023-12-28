# Stocks-analysis

Analyse des cours des stocks en Fortran, suivant le chapitre 5 de 'Modern Fortran' par Milan Curcic.

Objectifs du chapitre :

- Trouver les stocks avec les meilleres et pires performances
- Identifier les stocks à risque
- Identifier les bons moments pour acheter et vendre

## 1. Les données

Les données sont disponibles à ... et au format CSV, organisées de la manière suivante :

- `timestamp` : Date au format YYYY-mm-dd
- `open` : Prix à l'ouverture de la journée de trading
- `high` : Prix le plus haut atteint lors de la journée de trading
- `low` : Prix le plus bas atteint lors de la journée de trading
- `close`: Prix à la fermeture de la journée de trading
- `adjusted_close`: Prix de fermeture réajusté rétroactivement pour les 'stocks split'
- `volume` : Nombre total de parts tradé pendant la journée
- `dividend_amount`: Le nombre de dividende payé par part
- `split_coefficient`: Coefficient de division
