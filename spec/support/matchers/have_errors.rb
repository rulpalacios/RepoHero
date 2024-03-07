RSpec::Matchers.define :have_errors do |response|
    match do |response|
        response['errors'].present?
    end

    failure_message_when_negated do |response|
        "Expected there to be no errors, but there were: \n" +
        JSON.pretty_generate(response['errors'])
    end

    failure_message do |str|
        "Expected there to be errors, but there weren't"
    end
end