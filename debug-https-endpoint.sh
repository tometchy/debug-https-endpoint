#!/bin/sh

if [ -z "$TARGET" ]
then
      echo "TARGET environment variable is not assigned, exiting";
      exit 1;
fi

if [ -n "$SLEEP" ]
then
      echo "SLEEP environment variable assigned, waiting ${SLEEP} seconds";
      sleep $SLEEP;
fi

echo "Investigating target endpoint: $TARGET";

if [ "$DUMP_TRAFFIC" == "y" ]; then
      echo "DUMP_TRAFFIC environment variable set to: 'y', printing extensive debugging information, including a hex dump of all traffic";
      openssl s_client -connect $TARGET -debug -state;
else
      openssl s_client -connect $TARGET -state;
fi

printf "\nCertificate decoded:\n"
openssl s_client -connect $TARGET | openssl x509 -text
