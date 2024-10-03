---
version: "2.0"

services:
  simple-web-app:
    image: cro7/akash_web_app:0.0.1
    expose:
      - port: 8080
        as: 8080
        to:
          - global: true

profiles:
  compute:
    simple-web-app:
      resources:
        cpu:
          units: 1.0
        memory:
          size: 512Mi
        storage:
          size: 512Mi
  placement:
    akash:
      pricing:
        simple-web-app:
          denom: uakt
          amount: 10000

deployment:
  simple-web-app:
    akash:
      profile: simple-web-app
      count: 1
