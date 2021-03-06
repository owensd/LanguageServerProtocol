/*
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License in the project root for license information.
 */

/// Represents a diagnostic, such as a compiler error or warning. Diagnostic objects are only
/// valid in the scope of a resource.
public struct Diagnostic {
    public init(range: Range, message: String, severity: DiagnosticSeverity? = nil, code: DiagnosticCode? = nil, source: String? = nil) {
        self.range = range
        self.message = message
        self.severity = severity
        self.code = code
        self.source = source
    }

    /// The range at which the message applies.
    public var range: Range

    /// The diagnostics' severity. Can be omitted. If omitted it is up to the client to interpret
    /// diagnostics as error, warning, info or hint.
    public var severity: DiagnosticSeverity?

    /// The diagnostics code. Can be omitted.
    public var code: DiagnosticCode?

    /// A human-readable string describing the source of this diagnostic, e.g. 'typescript' or
    /// 'super lint'.
    public var source: String?

    /// The diagnostics message.
    public var message: String
}

/// A code to use within the `Diagnostic` type.
public enum DiagnosticCode {
    case number(Int)
    case string(String)
}

/// The protocol currently supports the following diagnostic severities:
public enum DiagnosticSeverity: Int {
    /// Reports an error.
    case error = 1
    /// Reports a warning.
    case warning = 2
    /// Reports an information.
    case information = 3
    /// Reports a hint.
    case hint = 4
}

public enum TraceSetting {
    case off
    case messages
    case verbose
}

public struct PublishDiagnosticsParams {
    public init(uri: DocumentUri, diagnostics: [Diagnostic]) {
        self.uri = uri
        self.diagnostics = diagnostics
    }
    
    /// The URI for which diagnostic information is reported.
    public var uri: DocumentUri

    /// An array of diagnostic information items.
    public var diagnostics: [Diagnostic]
}