#!/bin/bash

# Vytvoření cílového adresáře, pokud neexistuje
mkdir -p /var/www/html

# Definice prolinků podle schématu
declare -A prolinks
prolinks=(
    ["/web/1rocnik"]="/var/www/html/1rocnik"
    ["/web/2rocnik"]="/var/www/html/2rocnik"
    ["/web/3rocnik"]="/var/www/html/3rocnik"
    ["/web/4rocnik"]="/var/www/html/4rocnik"
    ["/web/maturita"]="/var/www/html/maturita"
)

# Vytvoření symbolických odkazů
for src in "${!prolinks[@]}"; do
    dest=${prolinks[$src]}
    
    # Kontrola, zda již symbolický odkaz existuje, pokud ano, smaže ho
    if [ -L "$dest" ]; then
        rm -f "$dest"
    fi
    
    # Vytvoření symbolického odkazu
    ln -s "$src" "$dest"
done

echo "Symbolické odkazy byly úspěšně vytvořeny."
