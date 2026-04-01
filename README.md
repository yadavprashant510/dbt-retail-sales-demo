# dbt Tutorial Sales Data

A demo `dbt` project that models retail sales data using a bronze/silver/gold layering pattern.

This repository includes:
- `dbt_tutorial_sales_data/dbt_project.yml` — dbt project configuration
- `dbt_tutorial_sales_data/models/bronze` — raw staging tables loaded from source data
- `dbt_tutorial_sales_data/models/silver` — transformed models for analytics
- `dbt_tutorial_sales_data/seeds/lookup.csv` — seed lookup data
- `dbt_tutorial_sales_data/macros` — reusable dbt macros
- `dbt_tutorial_sales_data/tests` — dbt tests and generic tests

## Requirements

- Python 3.12+
- `dbt-snowflake>=1.11.3`
- A valid `dbt` profile named `dbt_tutorial_sales_data`

## Setup

1. Activate your Python environment:
   ```bash
   source .venv/bin/activate
   ```
2. Install dependencies (if not already installed):
   ```bash
   pip install -r requirements.txt
   ```
   or if using `pyproject.toml`:
   ```bash
   pip install .
   ```
3. Configure your `profiles.yml` with a Snowflake connection under the profile name `dbt_tutorial_sales_data`.

## Running dbt

From the repository root, run:

```bash
cd dbt_tutorial_sales_data
dbt debug
dbt seed
dbt run
dbt test
```

## Project structure

- `models/bronze` — raw bronze tables materialized as `table` and loaded into the `bronze` schema
- `models/silver` — transformed silver models materialized as `table` and loaded into the `silver` schema
- `seeds/lookup.csv` — reference data used by models
- `macros/` — custom SQL macros for reuse
- `tests/` — dbt tests for validation and data quality

## Notes

- The project is configured to use `dbt-snowflake` by default.
- Adjust `dbt_project.yml` and `profiles.yml` as needed for your environment.
- The root `main.py` is a simple Python entry point and is not required for dbt execution.

## References

- dbt docs: https://docs.getdbt.com/
- dbt community: https://community.getdbt.com/
