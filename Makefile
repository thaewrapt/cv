LATEX2PDF=latex2pdf.sh
SCHEMA_VALIDATOR=schema_validator.pl
YAML2LATEX=yaml2latex.pl

CV_NAME=cv
CV_PDF=$(CV_NAME).pdf
CV_TEX=$(CV_NAME).tex
CV_AUX=$(CV_NAME).aux
CV_LOG=$(CV_NAME).log
OTHER_LOGS=texput.log
CV_OUT=$(CV_NAME).out
CV_YAML=$(CV_NAME).yaml
CV_SCHEMA=$(CV_NAME)_schema.yaml
#CV_TEMPLATE=$(CV_NAME)_tex.xslt
CV_TEMPLATE=$(CV_NAME)_tex.tt
DATA_DIR=data

all: $(CV_NAME)

check: schema_validation

schema_validation: $(DATA_DIR)/$(CV_YAML) $(DATA_DIR)/$(CV_SCHEMA)
	$(SCHEMA_VALIDATOR)

$(CV_TEX): $(DATA_DIR)/$(CV_YAML) $(DATA_DIR)/$(CV_SCHEMA) $(DATA_DIR)/$(CV_TEMPLATE)
	$(YAML2LATEX)

$(CV_NAME): $(CV_TEX) $(DATA_DIR)/$(CV_TEX)
	$(LATEX2PDF) 

clean: 
	$(RM) $(DATA_DIR)/$(CV_TEX) $(DATA_DIR)/$(CV_OUT) $(DATA_DIR)/$(CV_AUX) $(DATA_DIR)/$(CV_LOG) $(DATA_DIR)/$(OTHER_LOGS)

