







describe('Honda', function () {
  beforeEach(function () {
    this.honda = new Honda('Fit')
  })

  it('inherits the Vehicle prototype', function () {
    // Create a new Honda and call the toString method that comes from the Vehicle prototype
    expect(this.honda.toString()).toEqual('Honda Fit')
  })
  it('sets the model property when a valid model is passed in', function () {
    // Ensure both the make and model properties are correct
    expect(this.honda.make).toEqual('Honda')
    expect(this.honda.model).toEqual('Fit')
  })
  it('throws an error if an invalid model is passed in', function () {
    // Create a local function that you can pass to the expect function that will create a
    // new Honda with an invalid model. Use the toThrowError assertion to check for the
    // presence of the invalid model's name in the error message.
    expect(_ => new Honda('abc')).toThrowError('Model abc does not exist')
  })
  it('returns a list of valid models', function () {
    // Check both that a length property on the returned array is present using
    // toBeDefined and that one of the expected models is present in the array using toContain
    expect(Honda.getModels().length).toBeDefined()
    expect(Honda.getModels()).toContain('Civic')
  })
  it('calls getPrice when a new car is created', function () {
    // Create a spy on the getPrice method on the Honda object. When you create a
    // new Honda afterwards, the spy should register that the getPrice method was called,
    // and that it was called with the model you gave to the constructor.
    spyOn(Honda, 'getPrice')
    new Honda('Accord')
    expect(Honda.getPrice).toHaveBeenCalled()
    expect(Honda.getPrice).toHaveBeenCalledWith('Accord')
  })
  it('returns a price for the passed in model', function () {
    // Assert that the price be greater than zero
    expect(this.honda.price).toBeGreaterThan(0)
  })
  it('returns a price less than 15000 when a Civic is created', function () {
    let civic = new Honda('Civic')
    expect(civic.price).toBeLessThan(15000)
  })
  it('returns a price greater than 10000 when a CR-Z is created', function () {
    let crz = new Honda('CR-Z')
    expect(crz.price).toBeGreaterThan(10000)
  })

})