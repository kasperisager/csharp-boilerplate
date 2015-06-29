/**
 * Copyright (C) 2015 Kasper Kronborg Isager.
 */

using System;

namespace Application.Foo {
  /**
   * Example class included for the purpose of demonstration.
   */
  public class Bar {
    /**
     * A thingy that can store a string.
     */
    public string Thing {
      get;
      set;
    }

    /**
     * Write a message to the console.
     *
     * @param message The message to write to the console.
     */
    public void Baz(string message) {
      Console.WriteLine(message);
    }
  }
}
