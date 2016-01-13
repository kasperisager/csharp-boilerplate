/// Copyright (C) 2015 Kasper Kronborg Isager.

using Xunit;

namespace Application.Foo {
  /// <summary>Example unit test class included for the purpose of demonstration.</summary>
  public class BarTest {
    /// <summary>This is a fact and should hold.</summary>
    [Fact]
    public void Assertion() {
      Bar bar = new Bar();
      bar.Thing = "Hello World!";
      Assert.NotNull(bar);
      Assert.Equal("Hello World!", bar.Thing);
    }
  }
}
