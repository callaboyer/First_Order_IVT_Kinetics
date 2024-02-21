# Problem
An optimized in vitro transcription reaction creates as much product (nascent mRNA strands) with as little wasted reagents as possible. To avoid excess NTP waste in the mRNA synthesis step, an IVT reaction must be optimized for a specific mRNA sequence. However, it can be difficult to visualize NTP consumption in real-time unless an in/on/at-line process analytical technology method is used to quantitate NTP concentrations. Some labs may not have the equipment to take these real-time measurements, or initial IVT optimization studies may not be performed at scales that can support PAT probes.

## In Vitro Transcription Mechanism
The IVT reaction uses NTPs, capping reagents, plasmid templates, and enzymes to synthesize nascent mRNA strands. Like building lego towers from a set of directions, the RNA polymerase enzyme uses free NTPs to build a new mRNA strand from a DNA plasmid template. When NTPs are converted into NMPs to be incorporated into the nascent mRNA chain, a free pyrophosphate (PPi) is released. PPi is an inhibitor of RNA polymerase, so if PPi isn't cleared from the reaction, then RNA polymerase can't synthesize mRNA. To continue the IVT reaction, pyrophosphatase, an enzyme that hydrolyzes pyrophosphate, is incorporated into the reaction so that RNA polymerase can uninhibitedly synthesize nascent mRNA.

## First Order Rate Kinetics
A first order reaction is a type of reaction where reaction rate is dependent on the concentration of the reactants. When you're modeling a reaction as a first order reaction, you're assuming that increasing or decreasing the concentration of a reagent will increase or decrease the reaction rate.

As I get into in the model simplifications section, the IVT reaction probably follows Michaelis-Menten kinetics more closely than first order kinetics due to the enzymatic nature of the reaction.

# Solution
This code approaches tracking IVT kinetics in a very basic way. By measuring NTPs, the user can visualize NTP depletion on a plot (or 4 plots, which I commented out in the code). This code focuses on the impact of varying NTP concentrations to optimize the IVT reaction.

## Wet Lab Set-up
If I were to perform in-lab experiments to complement this model, I'd track NTP concentration as a function of time to understand how the reactants are consumed throughout the IVT reaction. I'd use this empirical data to fine tune the consumption rate constants and create a more robust in-silico model.

## Model Simplifications
This was my first coding project, so I decided to keep the reaction simple to get the hang of kinetic modeling!

It's important to note that this code is a simplification of the IVT reaction--there're multiple, independent factors that could affect the kinetics of the reaction, such as:

1. Since the IVT reaction is an enzymatic reaction, it might be more mechanistically accurate to describe the reaction by Michaelis-Menten kinetics instead of first order kinetics.
2. This code assumes a post-transcriptional capping step, since no capping reagent is incorporated into the reaction model.
3. Reaction temperature may affect the rate at which each NTP is incorporated by RNA polymerase.
4. Concentrations of plasmid and pyrophosphatase and buffer compositions could affect the activity of RNA polymerase.
5. Depending on the mRNA sequence being synthesized, the depletion of more frequently used, "limiting reagent" NTPs could cause the kinetics of the reaction to change.
