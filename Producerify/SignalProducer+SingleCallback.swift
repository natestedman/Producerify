// Producerify
// Written in 2016 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import ReactiveCocoa

extension SignalProducer
{
    // MARK: - Single Callback Functions

    /**
     Converts a function taking a success/error callback into a signal producer.

     - parameter callback: The callback function.
     */
    public init(callback: ((Value, Error?) -> ()) -> ())
    {
        self.init({ observer, _ in
            callback(SignalProducer.callback(observer))
        })
    }

    /**
     Converts a function taking an argument and an success/error callback into a signal producer.

     - parameter callback: The callback function.
     - parameter a:        The first argument.
     */
    public init<A>(callback: (A, (Value, Error?) -> ()) -> (), _ a: A)
    {
        self.init({ observer, _ in
            callback(a, SignalProducer.callback(observer))
        })
    }

    /**
     Converts a function taking 2 arguments and an success/error callback into a signal producer.

     - parameter callback: The callback function.
     - parameter a:        The first argument.
     - parameter b:        The second argument.
     */
    public init<A, B>(callback: (A, B, (Value, Error?) -> ()) -> (), _ a: A, _ b: B)
    {
        self.init({ observer, _ in
            callback(a, b, SignalProducer.callback(observer))
        })
    }

    /**
     Converts a function taking 3 arguments and an success/error callback into a signal producer.

     - parameter callback: The callback function.
     - parameter a:        The first argument.
     - parameter b:        The second argument.
     - parameter c:        The third argument.
     */
    public init<A, B, C>(callback: (A, B, C, (Value, Error?) -> ()) -> (), _ a: A, _ b: B, _ c: C)
    {
        self.init({ observer, _ in
            callback(a, b, c, SignalProducer.callback(observer))
        })
    }

    /**
     Converts a function taking 4 arguments and an success/error callback into a signal producer.

     - parameter callback: The callback function.
     - parameter a:        The first argument.
     - parameter b:        The second argument.
     - parameter c:        The third argument.
     - parameter d:        The fourth argument.
     */
    public init<A, B, C, D>(callback: (A, B, C, D, (Value, Error?) -> ()) -> (), _ a: A, _ b: B, _ c: C, _ d: D)
    {
        self.init({ observer, _ in
            callback(a, b, c, d, SignalProducer.callback(observer))
        })
    }

    /**
     Converts a function taking 5 arguments and an success/error callback into a signal producer.

     - parameter callback: The callback function.
     - parameter a:        The first argument.
     - parameter b:        The second argument.
     - parameter c:        The third argument.
     - parameter d:        The fourth argument.
     - parameter e:        The fifth argument.
     */
    public init<A, B, C, D, E>(callback: (A, B, C, D, E, (Value, Error?) -> ()) -> (), _ a: A, _ b: B, _ c: C, _ d: D, _ e: E)
    {
        self.init({ observer, _ in
            callback(a, b, c, d, e, SignalProducer.callback(observer))
        })
    }

    // MARK: - Utilities

    /**
    Produces a callback function, using the specified observer.

    - parameter observer: The observer to send events to.
    */
    private static func callback(observer: Observer<Value, Error>) -> (Value, Error?) -> ()
    {
        return { value, maybeError in
            if let error = maybeError
            {
                observer.sendFailed(error)
            }
            else
            {
                observer.sendNext(value)
                observer.sendCompleted()
            }
        }
    }
}
