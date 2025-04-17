# Utiliser l'image officielle de MySQL comme base
FROM mysql:latest

# Copier le fichier SQL dans le répertoire d'initialisation de MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Exposer le port MySQL (par défaut 3306)
EXPOSE 3306
