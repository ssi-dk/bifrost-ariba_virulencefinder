FROM ssidk/bifrost-base:2.0.5

ARG version="2.0.5"
ARG last_updated="19/07/2019"
ARG name="ariba_virulencefinder"
ARG full_name="bifrost-${name}"

LABEL \
    name=${name} \
    description="Docker environment for ${full_name}" \
    version=${version} \
    resource_version=${last_updated} \
    maintainer="kimn@ssi.dk;"

#- Tools to install:start---------------------------------------------------------------------------
RUN \
    apt-get update && apt-get install -y -qq --fix-missing \
        ariba=2.13.3+ds-1;
#- Tools to install:end ----------------------------------------------------------------------------

#- Additional resources (files/DBs): start ---------------------------------------------------------
RUN cd /bifrost_resources && \
    mkdir virulencefinder && \
    cd virulencefinder && \
    ariba getref virulencefinder virulencefinder --version 80c55fe && \
    ariba prepareref -f virulencefinder.fa -m virulencefinder.tsv ref_db;
#- Additional resources (files/DBs): end -----------------------------------------------------------

#- Source code:start -------------------------------------------------------------------------------
RUN cd /bifrost && \
    git clone --branch ${version} https://github.com/ssi-dk/${full_name}.git ${name};
#- Source code:end ---------------------------------------------------------------------------------

#- Set up entry point:start ------------------------------------------------------------------------
ENV PATH /bifrost/${name}/:$PATH
ENTRYPOINT ["launcher.py"]
CMD ["launcher.py", "--help"]
#- Set up entry point:end --------------------------------------------------------------------------