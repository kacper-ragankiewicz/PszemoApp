import Link from "next/link"

import { siteConfig } from "@/config/site"
import { buttonVariants } from "@/components/ui/button"
import { Login } from "@/components/login"

export default function IndexPage() {
  return (
    <section className="absolute top-0 z-30 flex h-full w-full justify-center bg-background p-10">
      <div className="border-1 h-1/2 w-1/2 rounded-lg border border-slate-800 p-10">
        <h1 className="w-full py-2">WELCOME ON OUR APP!</h1>
        <Login/>
      </div>
    </section>
  )
}
