/**
 * Copyright (C) 2015 Kasper Kronborg Isager.
 */

using System;
using Application.Foo;

namespace Application {
  /**
   * The class that contains the main entry point.
   */
  public static class Program {
    /**
     * The main entry point to the application.
     */
    public static void Main() {
      Bar bar = new Bar();
      bar.Thing = "Hello World!";

      Console.WriteLine(bar.Thing);
    }
  }
}
