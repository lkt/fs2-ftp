#!/usr/bin/env bash

set -e
git fetch --tags
echo -n "$PGP_PUBLIC" | base64 -d > /tmp/public.asc
echo -n "$PGP_SECRET" | base64 -d > /tmp/secret.asc
echo "credentials += Credentials(\"Sonatype Nexus Repository Manager\", \"oss.sonatype.org\", \"$SONATYPE_USER\", \"$SONATYPE_PASSWORD\")" > ~/.sbt/1.0/sonatype.sbt
sbt ++$TRAVIS_SCALA_VERSION! clean sonatypeBundleClean +publishSigned sonatypeBundleRelease