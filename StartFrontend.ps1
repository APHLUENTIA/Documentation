# StartFrontend.ps1

# Navigate to the .NET project directory
cd PlatformModule/AphluentiaPlusPlus/Backend

# Build and run the .NET project
dotnet build > dotnet_build_log.txt
Start-Process dotnet -ArgumentList "run" -NoNewWindow -RedirectStandardOutput dotnet_run_log.txt


# Wait for the .NET project to start before proceeding
Start-Sleep -Seconds 10

# Navigate to the ReactJS application directory
cd ../frontend

# Install dependencies (if needed)
# npm install

# Start the ReactJS application
npm run dev