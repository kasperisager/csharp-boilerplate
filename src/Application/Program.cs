/// Copyright (C) 2015 Kasper Kronborg Isager.

using System;
using Application.Foo;

namespace Application {
  /// <summary>The class that contains the main entry point.</summary>
  public static class Program {
    /// <summary>The main entry point to the application.</summary>
    public static void Main() {
      Bar bar = new Bar();
      bar.Thing = "Hello World!";
      bar.Baz(bar.Thing);
    }
  }
}
