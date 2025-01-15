"use client";
import { useEffect, useState } from "react";
import hljs from "highlight.js";
import "highlight.js/styles/github.css"; // Import the desired Highlight.js theme
export default function SyntaxHighlighter({
  code,
  language,
}: {
  code: string;
  language: string;
}) {
  const [highlightedCode, setHighlightedCode] = useState("");
  useEffect(() => {
    if (!code) return;
    try {
      // Highlight the code
      const highlighted = hljs.highlight(language, code, true).value;
      setHighlightedCode(highlighted);
    } catch (error) {
      console.error("Error highlighting code:", error);
      setHighlightedCode(
        code.replace(/</g, "&lt;").replace(/>/g, "&gt;"), // Escape HTML tags for safety
      );
    }
  }, [code, language]);
  return (
    <pre className="overflow-auto rounded bg-gray-100 p-4 text-sm">
      <code
        className={`hljs ${language}`}
        dangerouslySetInnerHTML={{ __html: highlightedCode }}
      />
    </pre>
  );
}