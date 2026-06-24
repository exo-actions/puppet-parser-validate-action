FROM ubuntu:26.04

LABEL name="puppet-parser-validate-action"
LABEL repository="https://github.com/exo-actions/puppet-parser-validate-action"
LABEL homepage="https://github.com/exo-actions/puppet-parser-validate-action"

LABEL "com.github.actions.name"="puppet-parser-validate-action"
LABEL "com.github.actions.description"="GitHub Action to run 'puppet parser validate' syntax check"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="orange"

LABEL "maintainer"="eXo Platform <https://github.com/exo-actions/>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg wget lsb-release && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://apt.voxpupuli.org/openvox-keyring.gpg | gpg --batch --yes --dearmor -o /usr/share/keyrings/openvox-keyring.gpg && \
    echo "# Sources for recent versions of puppet" > /etc/apt/sources.list.d/openvox.list && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openvox-keyring.gpg] http://apt.voxpupuli.org ubuntu$(lsb_release -r -s) openvox8" >> /etc/apt/sources.list.d/openvox.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends openvox-agent && \
    rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
