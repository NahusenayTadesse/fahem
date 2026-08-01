<script lang="ts">
	const links = [
		{ href: '/', label: 'Home' },
		{ href: '/our-coffee', label: 'Our Coffee' },
		{ href: '/about', label: 'About Us' },
		{ href: '/ventures', label: 'Ventures' },
		{ href: '/contact', label: 'Contact' },
	];

	const partners = [
		{ name: 'Coffee Ithaka', href: 'https://www.coffeeithaka.com' },
		{ name: 'Ecom Trading', href: 'https://www.ecomtrading.com/' },
		{ name: 'Louis Dreyfus Company', href: 'https://www.ldc.com/product/coffee/' },
		{ name: 'Touton', href: 'https://touton.com/' },
		{ name: 'Falcon Coffees', href: 'https://www.falconcoffees.com/' },
	];
</script>

<footer class="border-t border-border bg-muted/30">
	<div class="container mx-auto px-4 py-16 sm:px-6">
		<div class="grid gap-12 md:grid-cols-4">
			<div class="md:col-span-2">
				<a href="/" class="flex items-center gap-3">
					<img src="/logo.webp" alt="Fahem General Trading" class="h-16 w-auto sm:h-20" />
				</a>
				<p class="mt-4 max-w-sm text-sm text-muted-foreground">
					Harvested With Passion, Shared With Pride. Sourcing premium Ethiopian Arabica beans from
					the legendary Jimma Zone and beyond, for specialty and commercial markets worldwide.
				</p>
			</div>

			<div>
				<h3 class="text-sm font-semibold tracking-wide text-foreground">Navigate</h3>
				<ul class="mt-4 space-y-2">
					{#each links as link (link.href)}
						<li>
							<a
								href={link.href}
								class="text-sm text-muted-foreground transition-colors hover:text-primary"
							>
								{link.label}
							</a>
						</li>
					{/each}
				</ul>
			</div>

			<div>
				<h3 class="text-sm font-semibold tracking-wide text-foreground">Contact</h3>
				<ul class="mt-4 space-y-2 text-sm text-muted-foreground">
					<li>
						<a href="mailto:info@fahemgeneraltrading.com" class="transition-colors hover:text-primary">
							info@fahemgeneraltrading.com
						</a>
					</li>
					<li>
						<a href="tel:+251969211115" class="transition-colors hover:text-primary">
							+251 969 211 115
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="mt-12 border-t border-border pt-8">
			<p class="mb-4 text-center text-xs font-medium tracking-wide text-muted-foreground uppercase">
				Trusted Partners
			</p>
			<div class="flex flex-wrap items-center justify-center gap-x-8 gap-y-2">
				{#each partners as partner (partner.name)}
					<a
						href={partner.href}
						target="_blank"
						rel="noreferrer noopener"
						class="text-sm text-muted-foreground transition-colors hover:text-primary"
					>
						{partner.name}
					</a>
				{/each}
			</div>
		</div>

		<div
			class="mt-8 flex flex-col items-center justify-between gap-4 border-t border-border pt-8 text-xs text-muted-foreground sm:flex-row"
		>
			<p>Copyright &copy; {new Date().getFullYear()} Fahem General Trading. All rights reserved.</p>
			<a href="http://krinfud.com" target="_blank" rel="noreferrer noopener" class="hover:text-primary">
				Developed by Krinfud Digitals
			</a>
		</div>
	</div>
</footer>
