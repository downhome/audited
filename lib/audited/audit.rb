# frozen_string_literal: true

module Audited
  class Audit < ::ActiveRecord::Base
    include Auditable
  end
end
