# quakejs-ocp
QuakeJS on OpenShift - Based on QuakeJS - https://www.quakejs.com/
Initial Dockerisation by Patrick Do - https://github.com/patdohere

To run:
oc new-app --strategy=docker http://github.com/benemon/quakejs-ocp --name=quakejs

Expose the service on 8080. 27960 exists to support Dedicated Servers.

In theory, we can spin up a dedicated server container, and have a client container connecting to it. Haven't tried it, but the groundwork is there.

I'll template this out at some point.



