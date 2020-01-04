# About
JMeter with WebSocket Samplers and x11vnc on alpine linux

# Build
```
$ docker build -t <your-container-name-and-tag> -f ./Dockerfile .
```

# Usage
```
$ docker run -v path/to/your/tests:/home/alpine/tests -e PASSWD=<your-password-here> -d -p 5900:5900 <your-container-name-and-tag>
```

After this use a vnc-client (e.g. [TigerVNC viewer](https://bintray.com/tigervnc/stable/tigervnc/1.8.0)) to connect to your container.
Right click shows the menu, then select JMeter to run.

Every runs as user alpine. This user has sudo rights.
Password is set to random for security. Let me know your
use case if it needs to be manually set.

# Run load test in non-GUI mode

The above usage should only be used to build your tests. The tests should be executed in non-GUI mode as explained below.
```
$ docker run -v path/to/your/tests:/home/alpine/tests <your-container-name-and-tag> jmeter -n -t tests/TestName.jmx -l tests/results.jtl
```

For more information, see <http://jmeter.apache.org/usermanual/get-started.html#non_gui>
