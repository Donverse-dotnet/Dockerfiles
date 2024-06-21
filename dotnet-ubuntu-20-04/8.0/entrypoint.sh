# If env variable TZ is set, set the timezone
if [ -n "$TZ" ]; then
    sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
else
    sudo ln -snf /usr/share/zoneinfo/UTC /etc/localtime && echo UTC > /etc/timezone
fi

# Start the application
dotnet --version

# Default shell
bash
