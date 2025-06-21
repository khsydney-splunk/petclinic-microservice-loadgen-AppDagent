/*
* Copyright (C) Cisco Systems, Inc. and its affiliates
* 2025
* All Rights Reserved
*/

DUAL SIGNAL BETA

Dual Signal mode is an experimental feature that enables the traditional AppDynamics Java Agent
to run in combination with the Splunk OpenTelemetry Java Agent ("Dual Signal Beta").
The Dual Signal Beta generates OpenTelemetry signals, which can be used with Splunk O11y Cloud
and an AppDynamics controller simultaneously. Due to its experimental nature, use of the
Dual Signal Beta is subject to the applicable terms at
https://www.splunk.com/en_us/legal/appdynamics-limited-license-agreement.html. 

Enabling the Dual Signal Beta will consume more memory and CPU than running the AppDynamics
Java agent in regular mode. Actual consumption or ingestion metrics will depend on the type of
application and the application load. Please refer to the AppDynamics Documentation at
docs.appdynamics.com and Splunk Documentation at https://docs.splunk.com/observability/en/
for more information.

To try Dual Signal mode, download the Splunk distribution of OpenTelemetry Java Agent
splunk-otel-javaagent.jar from https://github.com/signalfx/splunk-otel-java/releases
and copy it to this directory.

Make sure you specify -Dappdynamics.opentelemetry.enabled=true on the java command line
to enable Dual Signal mode. Both components of the combined agent need to be configured
independently (e.g. the target AppD controller and OTel collector host and port). For example:

-Dappdynamics.agent.applicationName=MyApplication
-Dappdynamics.agent.tierName=WebServer
-Dappdynamics.agent.nodeName=Node_22
-Dappdynamics.controller.hostName=group11.corp.appdynamics.com
-Dotel.traces.exporter=otlp
-Dotel.metrics.exporter=otlp
-Dotel.logs.exporter=none
-Dotel.exporter.otlp.endpoint=http://localhost:4318
