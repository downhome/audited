module Audited
  class YAMLIfTextColumnType
    def initialize(audit_class)
      @audit_class = audit_class
    end

    def load(obj)
      if text_column?
        ActiveRecord::Coders::YAMLColumn.new(Object).load(obj)
      else
        obj
      end
    end

    def dump(obj)
      if text_column?
        ActiveRecord::Coders::YAMLColumn.new(Object).dump(obj)
      else
        obj
      end
    end

    def text_column?
      @audit_class.columns_hash["audited_changes"].type.to_s == "text"
    end
  end
end
