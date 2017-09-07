# About
JMeter with WebSocket Samplers and x11vnc on alpine linux

# Usage

    docker run -d -p 5900:5900 coolersport/jmeter

After this use vnc-client to connect to your container.
Right click shows the menu, then select JMeter to run.

Every runs as user alpine. This user has sudo rights.
Password is set to random for security. Let me know your
use case if it needs to be manually set.
