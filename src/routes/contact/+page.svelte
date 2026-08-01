<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import { reveal } from '$lib/actions/reveal';
	import { Mail, Phone, MapPin } from '@lucide/svelte';

	const emails = [
		{ label: 'Trade', value: 'trade@fahemgeneraltrading.com' },
		{ label: 'Import Manager', value: 'importmanager@fahemgeneraltrading.com' },
		{ label: 'General Inquiries', value: 'info@fahemgeneraltrading.com' }
	];

	const phones = ['+251 969 211 115', '+251 917 550 853'];
</script>

<svelte:head>
	<title>Contact Us | Fahem General Trading</title>
</svelte:head>

<!-- Hero -->
<section class="relative isolate overflow-hidden py-28 lg:py-36">
	<img
		src="/image5.webp"
		alt="A cup of coffee resting in a sea of ripe coffee cherries"
		class="enter-kenburns absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div
		class="enter-fade absolute inset-0 -z-10 bg-linear-to-b from-black/75 via-black/60 to-black/85"
		style="--enter-duration: 1400ms"
	></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<h1
			class="enter-rise font-heading text-5xl font-bold tracking-tight text-white md:text-6xl"
			style="--enter-delay: 150ms"
		>
			Contact Us
		</h1>
		<p class="enter-up mt-4 text-xl text-white/85" style="--enter-delay: 380ms">Get In Touch</p>
		<p class="enter-up mx-auto mt-4 max-w-xl text-white/80" style="--enter-delay: 500ms">
			Harvested With Passion, Shared With Pride
		</p>
	</div>
</section>

<!-- Details -->
<section class="py-16">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto grid max-w-4xl gap-6 md:grid-cols-3">
			<div use:reveal={{ y: 32, scale: 0.97 }}>
				<Card class="lift group h-full hover:border-primary/40 hover:shadow-lg">
					<CardContent class="pt-6">
						<MapPin
							class="size-8 text-primary transition-transform duration-500 group-hover:-translate-y-0.5"
						/>
						<h3 class="mt-4 font-semibold">Address</h3>
						<p class="mt-2 text-sm text-muted-foreground">
							Kera Road, Bulgaria, Diplomat Building, 3rd floor, office number 301
						</p>
					</CardContent>
				</Card>
			</div>

			<div use:reveal={{ delay: 110, y: 32, scale: 0.97 }}>
				<Card class="lift group h-full hover:border-primary/40 hover:shadow-lg">
					<CardContent class="pt-6">
						<Mail
							class="size-8 text-primary transition-transform duration-500 group-hover:-translate-y-0.5"
						/>
						<h3 class="mt-4 font-semibold">Email</h3>
						<ul class="mt-2 space-y-2">
							{#each emails as email (email.value)}
								<li>
									<p class="text-xs text-muted-foreground">{email.label}</p>
									<a
										href="mailto:{email.value}"
										class="text-sm break-all text-foreground transition-colors hover:text-primary"
									>
										{email.value}
									</a>
								</li>
							{/each}
						</ul>
					</CardContent>
				</Card>
			</div>

			<div use:reveal={{ delay: 220, y: 32, scale: 0.97 }}>
				<Card class="lift group h-full hover:border-primary/40 hover:shadow-lg">
					<CardContent class="pt-6">
						<Phone
							class="size-8 text-primary transition-transform duration-500 group-hover:-translate-y-0.5"
						/>
						<h3 class="mt-4 font-semibold">Phone</h3>
						<ul class="mt-2 space-y-1">
							{#each phones as phone (phone)}
								<li>
									<a
										href="tel:{phone.replace(/\s/g, '')}"
										class="text-sm text-foreground transition-colors hover:text-primary"
									>
										{phone}
									</a>
								</li>
							{/each}
						</ul>
					</CardContent>
				</Card>
			</div>
		</div>
	</div>
</section>
