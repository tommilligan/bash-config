
# include bash-config if it exists
bash_config="/path/to/bash-config/bash-config.sh"
if [ -f "$bash_config" ]; then
    echo "Loading common bash-config"
    . "$bash_config"
fi
