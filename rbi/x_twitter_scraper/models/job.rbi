# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Job < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::Job,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Job ID.
      sig { returns(String) }
      attr_accessor :id

      # Job title.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      # The job page on X.
      sig { returns(String) }
      attr_accessor :url

      # Where applicants apply, off X.
      sig { returns(T.nilable(String)) }
      attr_reader :apply_url

      sig { params(apply_url: String).void }
      attr_writer :apply_url

      # Location as the employer wrote it.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Where the work happens (onsite, remote or hybrid).
      sig { returns(T.nilable(String)) }
      attr_reader :location_type

      sig { params(location_type: String).void }
      attr_writer :location_type

      # Contract type (full_time, full_time_contract, part_time or contract_to_hire).
      sig { returns(T.nilable(String)) }
      attr_reader :employment_type

      sig { params(employment_type: String).void }
      attr_writer :employment_type

      # Seniority (intern, entry_level, junior, mid_level, senior, lead, manager or
      # executive).
      sig { returns(T.nilable(String)) }
      attr_reader :seniority_level

      sig { params(seniority_level: String).void }
      attr_writer :seniority_level

      # Job function, such as software_engineering.
      sig { returns(T.nilable(String)) }
      attr_reader :job_function

      sig { params(job_function: String).void }
      attr_writer :job_function

      # Team inside the company.
      sig { returns(T.nilable(String)) }
      attr_reader :team

      sig { params(team: String).void }
      attr_writer :team

      # When the employer posted the job.
      sig { returns(T.nilable(Time)) }
      attr_reader :posted_at

      sig { params(posted_at: Time).void }
      attr_writer :posted_at

      # Salary as X shows it.
      sig { returns(T.nilable(String)) }
      attr_reader :formatted_salary

      sig { params(formatted_salary: String).void }
      attr_writer :formatted_salary

      # Lowest salary, in salaryCurrencyCode per salaryInterval.
      sig { returns(T.nilable(Float)) }
      attr_reader :salary_min

      sig { params(salary_min: Float).void }
      attr_writer :salary_min

      # Highest salary, in salaryCurrencyCode per salaryInterval.
      sig { returns(T.nilable(Float)) }
      attr_reader :salary_max

      sig { params(salary_max: Float).void }
      attr_writer :salary_max

      # ISO 4217 currency code of the salary.
      sig { returns(T.nilable(String)) }
      attr_reader :salary_currency_code

      sig { params(salary_currency_code: String).void }
      attr_writer :salary_currency_code

      # Pay period of the salary (annually or hourly).
      sig { returns(T.nilable(String)) }
      attr_reader :salary_interval

      sig { params(salary_interval: String).void }
      attr_writer :salary_interval

      # Whether X features the job.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :featured

      sig { params(featured: T::Boolean).void }
      attr_writer :featured

      # Short summary of the job, as plain text.
      sig { returns(T.nilable(String)) }
      attr_reader :short_description

      sig { params(short_description: String).void }
      attr_writer :short_description

      # Full description as plain text, 1 line per paragraph.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Full description as Markdown, with headings, lists, links, bold & italics.
      sig { returns(T.nilable(String)) }
      attr_reader :description_markdown

      sig { params(description_markdown: String).void }
      attr_writer :description_markdown

      # The company profile of a job X imported from a job board.
      sig { returns(T.nilable(XTwitterScraper::Models::JobCompany)) }
      attr_reader :company

      sig { params(company: XTwitterScraper::Models::JobCompany::OrHash).void }
      attr_writer :company

      # The X account that posted a job. A job has none when X imported it from a job
      # board or no longer shows the account.
      sig { returns(T.nilable(XTwitterScraper::Models::JobAccount)) }
      attr_reader :account

      sig { params(account: XTwitterScraper::Models::JobAccount::OrHash).void }
      attr_writer :account

      sig do
        params(
          id: String,
          url: String,
          title: String,
          apply_url: String,
          location: String,
          location_type: String,
          employment_type: String,
          seniority_level: String,
          job_function: String,
          team: String,
          posted_at: Time,
          formatted_salary: String,
          salary_min: Float,
          salary_max: Float,
          salary_currency_code: String,
          salary_interval: String,
          featured: T::Boolean,
          short_description: String,
          description: String,
          description_markdown: String,
          company: XTwitterScraper::Models::JobCompany::OrHash,
          account: XTwitterScraper::Models::JobAccount::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Job ID.
        id:,
        # The job page on X.
        url:,
        # Job title.
        title: nil,
        # Where applicants apply, off X.
        apply_url: nil,
        # Location as the employer wrote it.
        location: nil,
        # Where the work happens (onsite, remote or hybrid).
        location_type: nil,
        # Contract type (full_time, full_time_contract, part_time or contract_to_hire).
        employment_type: nil,
        # Seniority (intern, entry_level, junior, mid_level, senior, lead, manager or
        # executive).
        seniority_level: nil,
        # Job function, such as software_engineering.
        job_function: nil,
        # Team inside the company.
        team: nil,
        # When the employer posted the job.
        posted_at: nil,
        # Salary as X shows it.
        formatted_salary: nil,
        # Lowest salary, in salaryCurrencyCode per salaryInterval.
        salary_min: nil,
        # Highest salary, in salaryCurrencyCode per salaryInterval.
        salary_max: nil,
        # ISO 4217 currency code of the salary.
        salary_currency_code: nil,
        # Pay period of the salary (annually or hourly).
        salary_interval: nil,
        # Whether X features the job.
        featured: nil,
        # Short summary of the job, as plain text.
        short_description: nil,
        # Full description as plain text, 1 line per paragraph.
        description: nil,
        # Full description as Markdown, with headings, lists, links, bold & italics.
        description_markdown: nil,
        # The company profile of a job X imported from a job board.
        company: nil,
        # The X account that posted a job. A job has none when X imported it from a job
        # board or no longer shows the account.
        account: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            title: String,
            url: String,
            apply_url: String,
            location: String,
            location_type: String,
            employment_type: String,
            seniority_level: String,
            job_function: String,
            team: String,
            posted_at: Time,
            formatted_salary: String,
            salary_min: Float,
            salary_max: Float,
            salary_currency_code: String,
            salary_interval: String,
            featured: T::Boolean,
            short_description: String,
            description: String,
            description_markdown: String,
            company: XTwitterScraper::Models::JobCompany,
            account: XTwitterScraper::Models::JobAccount
          }
        )
      end
      def to_hash
      end
    end
  end
end
