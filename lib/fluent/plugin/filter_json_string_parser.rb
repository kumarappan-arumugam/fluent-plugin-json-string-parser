#
# Copyright 2019- kumarappan-arumugam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'json'
require 'ostruct'
require 'fluent/plugin/filter'

module Fluent::Plugin
  class JsonStringParserFilter < Fluent::Plugin::Filter
    # Register this filter as "json_string_parser"
    Fluent::Plugin.register_filter('json_string_parser', self)

    desc 'Specify field name in the record to parse.'
    config_param :key_name, :string

    def filter(tag, time, record)
      if record.has_key?(key_name)
        raw = record[key_name]
        if raw[0] == '{' || raw[0] == '['
          begin
            # convert python single quotes if any to avoid json parse error
            raw.gsub(/'/,'"')
            converted = JSON.parse(raw, object_class: OpenStruct)
            record[key_name] = converted
          rescue JSON::ParserError # if there is a parse error pass the un-modified record as it is instead of failing
          end
        end
      end
      record
    end
  end
end
