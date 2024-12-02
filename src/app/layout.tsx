import type { Metadata } from "next";

import "./globals.css";

export const metadata: Metadata = {
  title: "Home | Non-profit template",
  description: "A template for your non-profit website, created by devsheke.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`antialiased`}>{children}</body>
    </html>
  );
}
