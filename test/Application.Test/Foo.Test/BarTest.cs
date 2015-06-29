/**
 * Copyright (C) 2015 Kasper Kronborg Isager.
 */

using Xunit;

namespace Application.Foo {
  /**
   *
   */
  public class BarTest {
    /**
     *
     */
    [Fact]
    public void Assertion() {
      Bar bar = new Bar();
      bar.Thing = "Hello World!";

      Assert.NotNull(bar);
      Assert.Equal("Hello World!", bar.Thing);
    }
  }
}
