# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Job < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Job ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute title
      #   Job title.
      #
      #   @return [String, nil]
      optional :title, String

      # @!attribute url
      #   The job page on X.
      #
      #   @return [String]
      required :url, String

      # @!attribute apply_url
      #   Where applicants apply, off X.
      #
      #   @return [String, nil]
      optional :apply_url, String, api_name: :applyUrl

      # @!attribute location
      #   Location as the employer wrote it.
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute location_type
      #   Where the work happens (onsite, remote or hybrid).
      #
      #   @return [String, nil]
      optional :location_type, String, api_name: :locationType

      # @!attribute employment_type
      #   Contract type (full_time, full_time_contract, part_time or contract_to_hire).
      #
      #   @return [String, nil]
      optional :employment_type, String, api_name: :employmentType

      # @!attribute seniority_level
      #   Seniority (intern, entry_level, junior, mid_level, senior, lead, manager or
      #   executive).
      #
      #   @return [String, nil]
      optional :seniority_level, String, api_name: :seniorityLevel

      # @!attribute job_function
      #   Job function, such as software_engineering.
      #
      #   @return [String, nil]
      optional :job_function, String, api_name: :jobFunction

      # @!attribute team
      #   Team inside the company.
      #
      #   @return [String, nil]
      optional :team, String

      # @!attribute posted_at
      #   When the employer posted the job.
      #
      #   @return [Time, nil]
      optional :posted_at, Time, api_name: :postedAt

      # @!attribute formatted_salary
      #   Salary as X shows it.
      #
      #   @return [String, nil]
      optional :formatted_salary, String, api_name: :formattedSalary

      # @!attribute salary_min
      #   Lowest salary, in salaryCurrencyCode per salaryInterval.
      #
      #   @return [Float, nil]
      optional :salary_min, Float, api_name: :salaryMin

      # @!attribute salary_max
      #   Highest salary, in salaryCurrencyCode per salaryInterval.
      #
      #   @return [Float, nil]
      optional :salary_max, Float, api_name: :salaryMax

      # @!attribute salary_currency_code
      #   ISO 4217 currency code of the salary.
      #
      #   @return [String, nil]
      optional :salary_currency_code, String, api_name: :salaryCurrencyCode

      # @!attribute salary_interval
      #   Pay period of the salary (annually or hourly).
      #
      #   @return [String, nil]
      optional :salary_interval, String, api_name: :salaryInterval

      # @!attribute featured
      #   Whether X features the job.
      #
      #   @return [Boolean, nil]
      optional :featured, XTwitterScraper::Internal::Type::Boolean

      # @!attribute short_description
      #   Short summary of the job, as plain text.
      #
      #   @return [String, nil]
      optional :short_description, String, api_name: :shortDescription

      # @!attribute description
      #   Full description as plain text, 1 line per paragraph.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute description_markdown
      #   Full description as Markdown, with headings, lists, links, bold & italics.
      #
      #   @return [String, nil]
      optional :description_markdown, String, api_name: :descriptionMarkdown

      # @!attribute company
      #   The company profile of a job X imported from a job board.
      #
      #   @return [XTwitterScraper::Models::JobCompany, nil]
      optional :company, -> { XTwitterScraper::Models::JobCompany }

      # @!attribute account
      #   The X account that posted a job. A job has none when X imported it from a job
      #   board or no longer shows the account.
      #
      #   @return [XTwitterScraper::Models::JobAccount, nil]
      optional :account, -> { XTwitterScraper::Models::JobAccount }

      # @!method initialize(id:, url:, title: nil, apply_url: nil, location: nil, location_type: nil, employment_type: nil, seniority_level: nil, job_function: nil, team: nil, posted_at: nil, formatted_salary: nil, salary_min: nil, salary_max: nil, salary_currency_code: nil, salary_interval: nil, featured: nil, short_description: nil, description: nil, description_markdown: nil, company: nil, account: nil)
      #   Public X job listing. A search returns the fields down to the salary, plus
      #   company & account. A lookup adds work type, seniority, function, team &
      #   descriptions. A field X leaves empty is left out.
      #
      #   @param id [String] Job ID.
      #
      #   @param url [String] The job page on X.
      #
      #   @param title [String] Job title.
      #
      #   @param apply_url [String] Where applicants apply, off X.
      #
      #   @param location [String] Location as the employer wrote it.
      #
      #   @param location_type [String] Where the work happens (onsite, remote or hybrid).
      #
      #   @param employment_type [String] Contract type (full_time, full_time_contract, part_time or contract_to_hire).
      #
      #   @param seniority_level [String] Seniority (intern, entry_level, junior, mid_level, senior, lead, manager or executive).
      #
      #   @param job_function [String] Job function, such as software_engineering.
      #
      #   @param team [String] Team inside the company.
      #
      #   @param posted_at [Time] When the employer posted the job.
      #
      #   @param formatted_salary [String] Salary as X shows it.
      #
      #   @param salary_min [Float] Lowest salary, in salaryCurrencyCode per salaryInterval.
      #
      #   @param salary_max [Float] Highest salary, in salaryCurrencyCode per salaryInterval.
      #
      #   @param salary_currency_code [String] ISO 4217 currency code of the salary.
      #
      #   @param salary_interval [String] Pay period of the salary (annually or hourly).
      #
      #   @param featured [Boolean] Whether X features the job.
      #
      #   @param short_description [String] Short summary of the job, as plain text.
      #
      #   @param description [String] Full description as plain text, 1 line per paragraph.
      #
      #   @param description_markdown [String] Full description as Markdown, with headings, lists, links, bold & italics.
      #
      #   @param company [XTwitterScraper::Models::JobCompany] The company profile of a job X imported from a job board.
      #
      #   @param account [XTwitterScraper::Models::JobAccount] The X account that posted a job. A job has none when X imported it from a job board or no longer shows the account.
    end
  end
end
