class Oystercard

    attr_reader :balance, :state, :entry_station
    # attr_accessor :state

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    FARE = 1

    def initialize
    @state = false
    @balance = 0
    end

    def top_up(amount)
        fail 'maximum balance #{MAXIMUM_BALANCE} exceeded' if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def touch_in(entry_station)
     @entry_station = entry_station
     raise 'minimum balance required' if @balance < MINIMUM_BALANCE
     @state = true
    end

    def touch_out
      @state = false
      deduct(FARE)
      @entry_station = nil
    end

    def in_journey?
      !@entry_station.nil?
    end

    private

    def deduct(amount)
        @balance -= amount
    end

end
