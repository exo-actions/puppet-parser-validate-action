FROM ubuntu:22.04

LABEL name="puppet-parser-validate-action"
LABEL repository="https://github.com/exoplatform/puppet-parser-validate-action"
LABEL homepage="https://github.com/exoplatform/puppet-parser-validate-action"

LABEL "com.github.actions.name"="puppet-parser-validate-action"
LABEL "com.github.actions.description"="GitHub Action to run 'puppet parser validate' syntax check"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="orange"

LABEL "maintainer"="eXo Platform <https://github.com/exoplatform/>"

RUN apt-get update
RUN apt-get install -y curl gnupg

RUN curl -fsSL https://apt.puppetlabs.com/keyring.gpg | gpg --batch --yes --dearmor -o /usr/share/keyrings/puppet-keyring.gpg && \
    echo "# Sources for recent versions of puppet" > /etc/apt/sources.list.d/puppetlab.list && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/puppet-keyring.gpg] http://apt.puppetlabs.com jammy puppet7" >> /etc/apt/sources.list.d/puppetlab.list
RUN apt-get update
RUN apt-get install -y puppet-agent
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
