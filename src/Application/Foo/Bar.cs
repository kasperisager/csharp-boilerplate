/// Copyright (C) 2015 Kasper Kronborg Isager.

using System;

namespace Application.Foo {
  /// <summary>Example class included for the purpose of demonstration.</summary>
  public class Bar {
    /// <summary>A thingy that can store a string.</summary>
    public string Thing {
      get;
      set;
    }

    /// <summary>Write a message to the console.</summary>
    /// <param name="message">The message to write to the console.</param>
    public void Baz(string message) {
      Console.WriteLine(message);
    }
  }
}
