from setuptools import setup, find_packages

setup(
    name='bifrost_ariba_virulencefinder',
    version='temp',
    url='https://github.com/ssi-dk/bifrost_ariba_virulencefinder',

    # Author details
    author='Kim Ng',
    author_email='kimn@ssi.dk',

    # Choose your license
    license='MIT',

    packages=find_packages(),
    python_requires='>=3.6',

    package_data={'bifrost_ariba_virulencefinder': ['config.yaml', 'pipeline.smk']},
    include_package_data=True,

    install_requires=[
        'bifrostlib==2.0.11'
    ]
)
