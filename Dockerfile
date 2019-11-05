FROM \
    ssidk/bifrost-base:2.0.5

LABEL \
    name="bifrost-ariba_virulencefinder" \
    description="Docker environment for ariba_virulencefinder in bifrost" \
    version="2.0.5" \
    DBversion="21/08/19" \
    maintainer="kimn@ssi.dk;"

RUN \
    conda install -yq -c conda-forge -c bioconda -c defaults ariba==2.13.3; \
    # In base image
    cd /bifrost_resources; \
    mkdir virulencefinder; \
    cd /bifrost_resources/virulencefinder; \
    ariba getref virulencefinder virulencefinder --version 80c55fe; \
    ariba prepareref -f virulencefinder.fa -m virulencefinder.tsv ref_db;

ENTRYPOINT \
    [ "/bifrost/whats_my_species/launcher.py"]
CMD \
    [ "/bifrost/whats_my_species/launcher.py", "--help"]