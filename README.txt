# isec-611-docker

A Docker simulation showcasing several privacy-preserving methods and tools. Allows mixing and matching multiple of them at the same time for the potential benefit.

Contains:
    - Firefox web browser
      - Browsec VPN extension
      - UBlockOrigin extension
      - PrivacyBadger extension
      - NoScript extension
    - Tor web browser

To start the environment:
    Run the start.sh file     
###########
#IMPORTANT:
#The firefox window that is opened automatically during startup must be closed in order for the sumulation to finish loading. Until it is done, the simulation will only function partially!
###########  
    Open host container in a new terminal by executing:
        sudo docker exec -it host /bin/bash
    Inside host run:
        ./settings.sh
    
It is suggested to test the degree of privacy by visiting the following addresses (although other can be used as well):
    - Cover Your Tracks (https://coveryourtracks.eff.org/)
        A comprehensive set of tests, showing how much of user's data is getting leaked. Great for testing the browser fingerprint
    - CreepJS (https://abrahamjuliot.github.io/creepjs/)
        Less user friendly than Cover Your Tracks, but tests against everything that can be extracted from JavaScript. 
        Excellent for testing for IP-address leakage by VPN's (in conjunction with the next tool)
    - WhatIsMyIPAddress (https://whatismyipaddress.com/)
        Detects user's public IP address
        Identifies if the address is part of VPN connection, TOR network, Proxy, etc.


Known issues:
Due to Tor Project only providing the latest version of the Tor Prowser, the link here will become outdated as soon as the new version releases. The link can be updated manually in the compose.yml file
