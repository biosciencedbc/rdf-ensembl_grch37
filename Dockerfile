FROM ruby:2.6

RUN mkdir /ensembl && \
    mkdir /data && \
    mkdir /work

WORKDIR /ensembl

ADD ./ /ensembl

ENV PERL5LIB=/ensembl/biomart-perl/lib
ENV PERL_AUTOINSTALL='--defaultdeps'

RUN cpan install XML::Simple
RUN cpan install DBI 
RUN cpan install Log::Log4perl
RUN cpan install Exception::Class
RUN cpan install XML::DOM
RUN cpan install Readonly 

ENTRYPOINT ["/ensembl/convert_ensembl"]



