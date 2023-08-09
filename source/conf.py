# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Module OR1'
copyright = '2022, Patrice Freydiere'
author = 'Patrice Freydiere'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["sphinxcontrib.video"]

templates_path = ['_templates']
exclude_patterns = []

language = 'fr'
today_fmt = '%d %b, %Y'
# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output


html_static_path = ['_static']

import sphinx_adc_theme
html_theme = 'sphinx_adc_theme'
html_theme_path = [sphinx_adc_theme.get_html_theme_path()]

latex_elements = {'preamble': """\\usepackage{draftwatermark}
                    \\SetWatermarkLightness{0.9}
                    \\SetWatermarkAngle{45}
                    \\SetWatermarkScale{5}
                    \\SetWatermarkFontSize{2cm}
                    \\SetWatermarkText{Draft}                
                  """}


