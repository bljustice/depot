FROM python:3.8.5

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install -U pip
RUN pip install dbt-duckdb==1.6.1

# Set environment variables
ENV DBT_DIR /dbt
ENV DBT_PROFILES_DIR /dbt

COPY . /dbt

# Set working directory
WORKDIR $DBT_DIR
