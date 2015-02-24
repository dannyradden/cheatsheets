cheatsheet do
  title 'RSpec Expectations 3.2'               # Will be displayed by Dash in the docset list
  docset_file_name 'RSpec Expectations 3.2'    # Used for the filename of the docset
  keyword 'rspec'                              # Used as the initial search keyword (listed in Preferences > Docsets)

  introduction <<-MD
    Each matcher can be used with `expect(..).to` or `expect(..).not_to` to define positive and negative expectations respectively on an object. Most matchers can also be accessed using the `(...).should` and `(...).should_not` syntax; see [using should syntax](https://github.com/rspec/rspec-expectations/blob/master/Should.md) for why we recommend using expect.
  MD

  # A cheat sheet must consist of categories
  category do
    id 'Built-in Matchers'  # Must be unique and is used as title of the category

    entry do
      name 'Object identity'
      command "be"
      notes <<-'MD'
        ```ruby
        expect(actual).to be(expected) # passes if actual.equal?(expected)
        ```
      MD
    end

    entry do
      name 'Object equivalence'
      command "eq"
      notes <<-'MD'
        ```ruby
        expect(actual).to eq(expected) # passes if actual == expected
        ```
      MD
    end

    entry do
      name "Optional APIs for identity/equibalence"
      command "eql"
      command "equal"
      notes <<-'MD'
        ```ruby
        expect(actual).to eql(expected)   # passes if actual.eql?(expected)
        expect(actual).to equal(expected) # passes if actual.equal?(expected)
        ```

        > NOTE: `expect` does not support `==` matcher.
      MD
    end

    entry do
      name "Comparisons"
      command "be > "
      command "be >="
      command "be <="
      command "be < "
      command "be_between"
      command "match"
      command "be_within .. of"
      command "start_with"
      command "end_with"
      notes <<-'MD'
        ```ruby
        expect(actual).to be >  expected
        expect(actual).to be >= expected
        expect(actual).to be <= expected
        expect(actual).to be <  expected
        expect(actual).to be_between(minimum, maximum).inclusive
        expect(actual).to be_between(minimum, maximum).exclusive
        expect(actual).to match(/expression/)
        expect(actual).to be_within(delta).of(expected)
        expect(actual).to start_with expected
        expect(actual).to end_with expected
        ```

        > NOTE: `expect` does not support `=~` matcher.
      MD
    end

    entry do
      name "Types/classes/response"
      command "be_instance_of"
      command "be_kind_of"
      command "respond_to"
      notes <<-'MD'
        ```ruby
        expect(actual).to be_instance_of(expected)
        expect(actual).to be_kind_of(expected)
        expect(actual).to respond_to(expected)
        ```
      MD
    end

    entry do
      name "Truthiness and existentialism"
      command "be_truthy"
      command "be true"
      command "be_falsey"
      command "be false"
      command "be_nil"
      command "exist"
      notes <<-'MD'
        ```ruby
        expect(actual).to be_truthy    # passes if actual is truthy (not nil or false)
        expect(actual).to be true      # passes if actual == true
        expect(actual).to be_falsey    # passes if actual is falsy (nil or false)
        expect(actual).to be false     # passes if actual == false
        expect(actual).to be_nil       # passes if actual is nil
        expect(actual).to exist        # passes if actual.exist? and/or actual.exists? are truthy
        expect(actual).to exist(*args) # passes if actual.exist?(*args) and/or actual.exists?(*args) are truthy
        ```
      MD
    end

    entry do
      name "Expecting errors"
      command 'raise_error'

      notes <<-'MD'
        ```ruby
        expect { ... }.to raise_error
        expect { ... }.to raise_error(ErrorClass)
        expect { ... }.to raise_error("message")
        expect { ... }.to raise_error(ErrorClass, "message")
        ```
      MD
    end

    entry do
      name "Expecting throws"
      command "throw_symbol"
      notes <<-'MD'
        ```ruby
        expect { ... }.to throw_symbol
        expect { ... }.to throw_symbol(:symbol)
        expect { ... }.to throw_symbol(:symbol, 'value')
        ```
      MD
    end

    entry do
      name "Predicate matchers"
      command "be_*"
      command "have_*"

      notes <<-'MD'
        ```ruby
        expect(actual).to be_xxx         # passes if actual.xxx?
        expect(actual).to have_xxx(:arg) # passes if actual.has_xxx?(:arg)
        ```

        #### Examples

        ```ruby
        expect([]).to      be_empty
        expect(:a => 1).to have_key(:a)
        ```
      MD
    end

    entry do
      name "Collection membership"
      command 'include'
      command 'match_array'
      command 'contain_exactly'
      notes <<-'MD'
        ```ruby
        expect(actual).to include(expected)
        expect(array).to match_array(expected_array)
        # ...which is the same as:
        expect(array).to contain_exactly(individual, elements)
        ```

        #### Examples

        ```ruby
        expect([1, 2, 3]).to     include(1)
        expect([1, 2, 3]).to     include(1, 2)
        expect(:a => 'b').to     include(:a => 'b')
        expect("this string").to include("is str")
        expect([1, 2, 3]).to     contain_exactly(2, 1, 3)
        expect([1, 2, 3]).to     match_array([3, 2, 1])
        ```
      MD
    end

    entry do
      name "Ranges (1.9 only)"
      command "cover"
      notes <<-'MD'
        ```ruby
        expect(1..10).to cover(3)
        ```
      MD
    end

    entry do
      name "Change observation"
      command "change .. from .. to"
      command "change .. by"
      command "change .. by_at_least"
      command "change .. by_at_most"

      notes <<-'MD'
        ```ruby
        expect { object.action }.to change(object, :value).from(old).to(new)
        expect { object.action }.to change(object, :value).by(delta)
        expect { object.action }.to change(object, :value).by_at_least(minimum_delta)
        expect { object.action }.to change(object, :value).by_at_most(maximum_delta)
        ```

        #### Examples

        ```ruby
        expect { a += 1 }.to change { a }.by(1)
        expect { a += 3 }.to change { a }.from(2)
        expect { a += 3 }.to change { a }.by_at_least(2)
        ```
      MD
    end

    entry do
      name "Satisfy"
      command "satisfy"
      notes <<-'MD'
        ```ruby
        expect(actual).to satisfy { |value| value == expected }
        ```
      MD
    end

    entry do
      name "Output capture"
      command "output"
      notes <<-'MD'
        ```ruby
        expect { actual }.to output("some output").to_stdout
        expect { actual }.to output("some error").to_stderr
        ```
      MD
    end

    entry do
      name "Block expectation"
      command "yield_control"
      command "yield_with_no_args"
      command "yield_with_args"
      command "yield_successive_args"
      notes <<-'MD'
        ```ruby
        expect { |b| object.action(&b) }.to yield_control
        expect { |b| object.action(&b) }.to yield_with_no_args           # only matches no args
        expect { |b| object.action(&b) }.to yield_with_args              # matches any args
        expect { |b| object.action(&b) }.to yield_successive_args(*args) # matches args against multiple yields
        ```

        #### Examples

        ```ruby
        expect { |b| User.transaction(&b) }.to yield_control
        expect { |b| User.transaction(&b) }.to yield_with_no_args
        expect { |b| 5.tap(&b)            }.not_to yield_with_no_args         # because it yields with `5`
        expect { |b| 5.tap(&b)            }.to yield_with_args(5)             # because 5 == 5
        expect { |b| 5.tap(&b)            }.to yield_with_args(Fixnum)        # because Fixnum === 5
        expect { |b| [1, 2, 3].each(&b)   }.to yield_successive_args(1, 2, 3)
        ```
      MD
    end
  end
end
